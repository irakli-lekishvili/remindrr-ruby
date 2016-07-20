require 'spec_helper'

describe Remindrr::App do

  context 'attributes' do
    describe Remindrr::App.new({
        id: 1,
        name: 'name',
        endpoint: 'http://localhost:3000',
        created_at: Time.new(1),
        updated_at: Time.new(2)
      }) do

      it { is_expected.to have_attributes(id: 1, name: 'name') }
      it { is_expected.to have_attributes(endpoint: 'http://localhost:3000') }
      it { is_expected.to have_attributes(created_at: Time.new(1)) }
      it { is_expected.to have_attributes(updated_at: Time.new(2)) }
    end
  end
end
