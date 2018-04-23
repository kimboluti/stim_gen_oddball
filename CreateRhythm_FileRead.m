function m = CreateRhythm_FileRead(avec,freqvec,flag)

% this function reads in a CSV text file of durations = dvec_ms, in ms
% #cols in duration vector must equal #cols in avec and freqvec

%dvec_ms = vector of durations in ms; will be obtained from excel;
%avec = vector of amplitudes in 0 - 1 range;
%freqvec = vector of frequencies of each tone in hertz;

fs = 44100;        %sampling rate.
rdur = 5;          %ramp duration in ms.

[filename, pathname] = uigetfile;
full_path = strcat(pathname, filename);

dvec_ms = csvread(full_path);

n1 = size(dvec_ms,2);  %duration vec
n1b = size(dvec_ms,1); %number of levels (rows)
n2 = length(avec);  %amplitude vector to specific intensity of each tone
n3 = length(freqvec); %frequency vector to specify pitch of each tone

dvec = dvec_ms/1000;  %make sure that elements of duration vector are in sec.

for j=1:n1b %to make a sound file for each row of dvec
    
        svec = [];
        for i = 1:n1
            svec = [svec,ramp_sound(MakeSineTone(freqvec(i),dvec(j,i),avec(i),fs,0),rdur,fs)];
        end

        if (flag == 1) 
            wavplay(svec,fs);
        end

    svec = svec*0.99; %prevent clipping
    
        FPdur = num2str(dvec_ms(j,2));
        OBdur = num2str(dvec_ms(j,3));
    filename = strcat('FPdur',num2str(FPdur),'OBdur',num2str(OBdur),'.wav');
    
    wavwrite(svec,fs,filename);
end
    
end
