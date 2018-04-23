function m = MakeSineTone(freq,duration,amp,fs,flag)

%frequency is in hertz
%duration is in seconds
%amp is the intensity value between 0 and 1
%fs = sampling rate, typically 44100 Hz

t = 0:1/fs:(duration - (1/fs));
tone = sin(freq*2*pi*t)*amp;
if (flag == 1)
    wavplay(tone,fs);
end

m = tone;
end