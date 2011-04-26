Factory.define(:admin, :class => User) do |u|
  u.email "chuck@teachmetocode.com"
  u.password "password"
end

Factory.sequence(:email) do |n|
  "person#{n}@email.com"
end

Factory.define(:user) do |u|
  u.email { Factory.next(:email) }
  u.password "password"
end

Factory.sequence(:show_name) do |n|
  "show ##{n}"
end

Factory.sequence(:slug) do |n|
  "slug#{n}"
end

Factory.define(:show) do |s|
  s.name { Factory.next(:show_name) }
  s.slug { Factory.next(:slug) }
end

Factory.sequence(:category_name) do |n|
  "category ##{n}"
end

Factory.define(:category) do |s|
  s.name { Factory.next(:category_name) }
end

Factory.sequence(:feed_name) do |n|
  "feed ##{n}"
end

Factory.define(:feed) do |s|
  s.name { Factory.next(:feed_name) }
  s.slug { Factory.next(:slug)}
end

Factory.sequence(:episode_name) do |n|
  "episode ##{n}"
end

Factory.define(:episode) do |s|
  s.title { Factory.next(:episode_name) }
  s.slug { Factory.next(:slug)}
  s.copy "This is the episode copy."
  s.show { |e| e.association(:show) }
end