function m = ramp_sound(stim,ramp_dur_in_ms,fs)

%fs = sampling rate (44100)
%ramp_dur_in_ms = duration of ramp in ms to avoid transients

ramp_dur_in_s = ramp_dur_in_ms / 1000;
ramp_dur_in_samples = round(fs * ramp_dur_in_s);
begin_ramp = linspace(0,1,ramp_dur_in_samples);
end_ramp = linspace(1,0,ramp_dur_in_samples);
num_samples = length(stim);
num_fillers = num_samples - (2 * ramp_dur_in_samples); 
filler_matrix = ones(1,num_fillers);
scale_matrix = [begin_ramp filler_matrix end_ramp];
ramped_stim = stim .* scale_matrix;

m = ramped_stim;

end