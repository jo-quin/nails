# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Run server', type: :aruba do
  before do
    cd '../..'
    run_command 'ruby server.rb'
  end

  it { expect(last_command_started).to have_output(/Nails server started on 8080/) }
end

RSpec.describe 'Visit main page', type: :feature do
  it 'can see nails success message' do
    visit '/'

    expect(page).to have_content 'You nailed it!'
  end
end
