# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

	post = Post.create([{ name: 'Post_1', title: 'Post_1_title_1',content: 'Post_1_title_1_content_1'}, { name: 'Post_2', title: 'Post_2_title_2',content: 'Post_2_title_2_content_2'}])
	puts post.as_json 
    # Character.create(name: 'Luke', movie: movies.first)	
