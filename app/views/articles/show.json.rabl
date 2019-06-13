object @article
attributes :title, :description

child :user do 
	attributes :name, :email
	node(:url) {|user| user_url(user)}
end
	

child :comments do 
	attributes :body
end