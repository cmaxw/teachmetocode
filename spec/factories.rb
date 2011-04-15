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