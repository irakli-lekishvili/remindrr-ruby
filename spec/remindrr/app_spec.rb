require 'spec_helper'

describe Remindrr::App do
  before do
    Remindrr.configure do |config|
      config.client_secret = '12345'
    end
  end

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

  context '#all' do
    before do
      VCR.use_cassette 'apps' do
        @apps = Remindrr::App.all
      end
    end

    it { expect(@apps.length).to eq 2 }
    it { expect(@apps).to be_a Array }
    it { expect(@apps.sample).to be_a Remindrr::App }
  end

  context '#find' do
    before do
      VCR.use_cassette 'app' do
        @app = Remindrr::App.find(2)
      end
    end

    it { expect(@app).to be_a Remindrr::App }
  end

  context '#create' do
    before do
      VCR.use_cassette 'new_app' do
        @app = Remindrr::App.create({ name: 'tars', endpoint: 'http://t.co' })
      end
    end

    it { expect(@app.id).not_to be_nil }
    it { expect(@app).to be_a Remindrr::App }
  end

  context '#save' do
    let (:app) { Remindrr::App.all.first }

    before do
      VCR.use_cassette 'updated_app' do
        app.name     = 'tars2'
        app.endpoint = 'http://t.co'
        app.save
      end
    end

    it { expect(app).to have_attributes(name: 'tars2') }
    it { expect(app).to have_attributes(endpoint: 'http://t.co') }
    it { expect(app).to be_a Remindrr::App }
  end
end
