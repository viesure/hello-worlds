puts "Hello World"

with_fx :reverb do
  sleep 0.4
  in_thread do
    loop do
      r = [0.5, 1.0/3, 3.0/5].choose
      8.times do
        sample './samples/hello_world.wav', pan: rrand(-1, 1)
        sleep 4
      end
    end
  end
end

with_fx :pitch_shift do
  sleep 2.4
  in_thread do
    loop do
      r = [0.5, 1.0/3, 3.0/5].choose
      8.times do
        sample './samples/hello_viesure.wav', pan: rrand(-1, 1), pitch: rrand(-6, 0), amp: 4
        sleep 4
      end
    end
  end
end

with_fx :wobble, phase: 2 do |w|
  with_fx :echo, mix: 0.6 do
    loop do
      sample :drum_heavy_kick
      sample :bass_hit_c, rate: 0.8, amp: 0.4
      sleep 0.5
    end
  end
end
