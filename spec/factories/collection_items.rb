# frozen_string_literal: true

FactoryBot.define do
  factory :collection_item do
    name { 'CollectionItem name' }
    description { 'This is the description for my CollectionItem' }
    maker { 'MyMaker' }
    paid_price { 100.00 }
    current_value { 200.00 }
    serial_number { 'Serial1020' }
    origin { 'MyOrigin' }
    circa { 2010 }
    condition { 1 }
    signed { false }
    collection
  end
end
