# == Schema Information
#
# Table name: images
#
#  id                      :integer          not null, primary key
#  imageable_id            :integer
#  imageable_type          :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  image_name_file_name    :string(255)
#  image_name_content_type :string(255)
#  image_name_file_size    :integer
#  image_name_updated_at   :datetime
#

require 'spec_helper'

describe Image do
  pending "add some examples to (or delete) #{__FILE__}"
end
