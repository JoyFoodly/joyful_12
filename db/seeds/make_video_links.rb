v=VideoLink.find_or_create_by(name: "How to Prep Cauliflower")
v.height=202
v.width=360
v.provider_id="104352702"
v.sort_order=0
v.category="prep"
v.save


f=Food.find_by_name 'Sweet Potato'
f.video_links << v
