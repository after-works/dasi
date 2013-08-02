ThinkingSphinx::Index.define :song, :with => :active_record do
  #fields
  indexes title 
  
  #attributes
  has tag_id, uid, created_at, updated_at
end