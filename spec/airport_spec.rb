require 'airport'
## Note these are just some guidelines!
## Feel free to write more tests!!

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land

describe Airport do
  let(:plane) { double :plane }

  describe '#capacity' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end
  end

  describe '#land' do
    before(:each) do
      allow(plane).to receive(:land)
    end

    it 'clears a plane to land' do
      expect(subject).to respond_to(:clear_to_land).with(1).argument
    end

    it 'receives a plane' do
      expect(subject.clear_to_land(plane)).to eq(plane)
    end

    it 'having landed a plane' do
      subject.clear_to_land(plane)
      expect(subject.planes).not_to be_empty
    end
  end

  describe '#take off' do
    before(:each) do
      allow(plane).to receive(:land)
      subject.clear_to_land(plane)
      allow(plane).to receive(:take_off)
    end

    it 'clears a plane to take off' do
      expect(subject).to respond_to(:clear_to_take_off)
    end

    it 'releases a plane' do
      expect(subject.clear_to_take_off).to eq(plane)
    end

    it 'having cleared a plane to take off' do
      subject.clear_to_take_off
      expect(subject.planes).to be_empty
    end
  end

  describe 'air traffic control' do
    context 'when airport is full' do
      before(:each) do
        allow(plane).to receive(:land)
      end

      it 'does not allow a plane to land' do
        subject.capacity.times { subject.clear_to_land(plane) }
        expect { subject.clear_to_land(plane) }.to raise_error "airport full"
      end
    end

    context 'when airport is empty' do
      it 'does not allow a plane to be cleared to take off' do
        expect { subject.clear_to_take_off }.to raise_error "no planes waiting"
      end
    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'when weather conditions are stormy' do
      it 'does not allow a plane to take off'

      it 'does not allow a plane to land'
    end
  end

end
