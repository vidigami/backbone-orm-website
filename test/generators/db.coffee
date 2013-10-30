util = require 'util'
assert = require 'assert'
_ = require 'underscore'
Backbone = require 'backbone'
Queue = require 'backbone-orm/lib/queue'
Utils = require 'backbone-orm/lib/utils'
ModelCache = require('backbone-orm/lib/cache/singletons').ModelCache
QueryCache = require('backbone-orm/lib/cache/singletons').QueryCache
bbCallback = Utils.bbCallback

module.exports = (options, callback) ->
  DATABASE_URL = options.database_url or ''
  BASE_SCHEMA = options.schema or {}
  SYNC = options.sync
  BASE_COUNT = 5

  OMIT_KEYS = ['owner_id', '_rev', 'created_at', 'updated_at']

  class Flat extends Backbone.Model
    urlRoot: "#{DATABASE_URL}/flats"
    @schema: BASE_SCHEMA
    sync: SYNC(Flat)

  class Reverse extends Backbone.Model
    urlRoot: "#{DATABASE_URL}/reverses"
    @schema: _.defaults({
      owner: -> ['belongsTo', Owner]
      another_owner: -> ['belongsTo', Owner, as: 'more_reverses']
    }, BASE_SCHEMA)
    sync: SYNC(Reverse)

  class ForeignReverse extends Backbone.Model
    urlRoot: "#{DATABASE_URL}/foreign_reverses"
    @schema: _.defaults({
      owner: -> ['belongsTo', Owner, foreign_key: 'ownerish_id']
    }, BASE_SCHEMA)
    sync: SYNC(ForeignReverse)

  class Owner extends Backbone.Model
    urlRoot: "#{DATABASE_URL}/owners"
    @schema: _.defaults({
      flats: -> ['hasMany', Flat]
      reverses: -> ['hasMany', Reverse]
      more_reverses: -> ['hasMany', Reverse, as: 'another_owner']
      foreign_reverses: -> ['hasMany', ForeignReverse]
    }, BASE_SCHEMA)
    sync: SYNC(Owner)

  describe "Website tests (db: #{DATABASE_URL}, cache: #{options.cache}, query_cache: #{options.query_cache}, embed: #{options.embed})", ->

    before (done) -> return done() unless options.before; options.before([Flat, Reverse, ForeignReverse, Owner], done)
    after (done) -> callback(); done()
    beforeEach (done) ->
      relation = Owner.relation('reverses')
      delete relation.virtual
      MODELS = {}

      queue = new Queue(1)

      # reset caches
      queue.defer (callback) -> ModelCache.configure({enabled: !!options.cache, max: 100}).reset(callback) # configure model cache
      queue.defer (callback) -> QueryCache.configure({enabled: !!options.query_cache, verbose: false}).reset(callback) # configure query cache

      # destroy all
      queue.defer (callback) -> Utils.resetSchemas [Flat, Reverse, ForeignReverse, Owner], callback

      # create all
      queue.defer (callback) ->
        create_queue = new Queue()

        create_queue.defer (callback) -> Fabricator.create(Flat, 2*BASE_COUNT, {
          name: Fabricator.uniqueId('flat_')
          created_at: Fabricator.date
        }, (err, models) -> MODELS.flat = models; callback(err))
        create_queue.defer (callback) -> Fabricator.create(Reverse, 2*BASE_COUNT, {
          name: Fabricator.uniqueId('reverse_')
          created_at: Fabricator.date
        }, (err, models) -> MODELS.reverse = models; callback(err))
        create_queue.defer (callback) -> Fabricator.create(Reverse, 2*BASE_COUNT, {
          name: Fabricator.uniqueId('reverse_')
          created_at: Fabricator.date
        }, (err, models) -> MODELS.more_reverse = models; callback(err))
        create_queue.defer (callback) -> Fabricator.create(ForeignReverse, BASE_COUNT, {
          name: Fabricator.uniqueId('foreign_reverse_')
          created_at: Fabricator.date
        }, (err, models) -> MODELS.foreign_reverse = models; callback(err))
        create_queue.defer (callback) -> Fabricator.create(Owner, BASE_COUNT, {
          name: Fabricator.uniqueId('owner_')
          created_at: Fabricator.date
        }, (err, models) -> MODELS.owner = models; callback(err))

        create_queue.await callback

      # link and save all
      queue.defer (callback) ->
        save_queue = new Queue()

        for owner in MODELS.owner
          do (owner) -> save_queue.defer (callback) ->
            owner.set({
              flats: [MODELS.flat.pop(), MODELS.flat.pop()]
              reverses: [MODELS.reverse.pop(), MODELS.reverse.pop()]
              more_reverses: [MODELS.more_reverse.pop(), MODELS.more_reverse.pop()]
              foreign_reverses: [MODELS.foreign_reverse.pop()]
            })
            owner.save {}, bbCallback callback

        save_queue.await callback

      queue.await done

    it 'Runs the example example', (done) ->
      done()
