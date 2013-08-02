ThinkingSphinx::Index.define :songtag, :with => :active_record do
  #fields
  indexes title
  indexes content
  
  #attributes
  has uid, created_at, updated_at
end