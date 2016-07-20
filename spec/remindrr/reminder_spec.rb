require 'spec_helper'

context Remindrr::Reminder do
  before do
    Remindrr.configure do |config|
      config.client_secret = '12345'
    end
  end

  let(:app) { Remindrr::App.all.first }

  context 'attributes' do
    describe Remindrr::Reminder.new({
      id: 1,
      remind_at: Time.new(1),
      attempt_count: 0,
      data: {},
      created_at: Time.new(2),
    }) do

      it { is_expected.to have_attributes(id: 1, remind_at: Time.new(1)) }
      it { is_expected.to have_attributes(attempt_count: 0, data: {}) }
      it { is_expected.to have_attributes(created_at: Time.new(2)) }
    end
  end

  context '#all' do
    before do
      VCR.use_cassette 'reminders' do
        @reminder = Remindrr::Reminder.all(app)
      end
    end

    it { expect(@reminder.length).to eq 1 }
    it { expect(@reminder).to be_a Array }
    it { expect(@reminder.sample).to be_a Remindrr::Reminder }
  end

  context '#find' do
    before do
      VCR.use_cassette 'reminder' do
        @reminder = Remindrr::Reminder.find(app, 5)
      end
    end

    it { expect(@reminder).to be_a Remindrr::Reminder }
  end

  context '#create' do
    before do
      VCR.use_cassette 'new_reminder' do
        @reminder = Remindrr::Reminder.create(app, { data: {}, remind_at: Time.now })
      end
    end

    it { expect(@reminder.id).not_to be_nil }
    it { expect(@reminder).to be_a Remindrr::Reminder }
  end

  context '#on' do
    before { Remindrr::Reminder.on do end }

    it { expect(Remindrr::Reminder.instance_variable_get(:@block)).not_to be nil }
  end

  context '#receive' do
    let(:proc) { Proc.new { |args| args } }
    before { Remindrr::Reminder.on(&proc) }

    it { expect(Remindrr::Reminder.receive('foo')).to eq('foo') }
  end
end
