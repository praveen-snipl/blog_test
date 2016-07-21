class Article < ActiveRecord::Base

	after_save :expire_cache
	# after_update :expire_cache

	validates :title, presence: true

	def expire_cache
		# ActionController::Base.new.fragment_exist("views.localhost3000.articles.#{self.id}")
		Publisher.broadcast_event('article.updated', article: self)
	end
end
