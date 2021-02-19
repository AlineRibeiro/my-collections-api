# frozen_string_literal: true

class CompanyHashtag < ApplicationRecord
  belongs_to :company
  belongs_to :hashtag

  validates_uniqueness_of :hashtag_id, scope: :company_id,
                                       message: 'This hashtag has already been assigned to this business'
end
