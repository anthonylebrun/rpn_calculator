require_relative '../../lib/message_printer'

# Meh tests for a blah object. Moving along.

describe MessagePrinter do

  let(:message) { 'Foo Bar' }

  it "should print success messages" do
    expect(STDOUT).to receive(:puts)
    MessagePrinter.success(message)
  end

  it "should print error messages" do
    expect(STDOUT).to receive(:puts)
    MessagePrinter.error(message)
  end

  it "should print notice messages" do
    expect(STDOUT).to receive(:puts)
    MessagePrinter.notice(message)
  end
end