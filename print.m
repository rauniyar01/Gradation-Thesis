%% AWGN信道的误码性能
if 1

figure(1);

x = 0:0.5:10;
y1 = 0.5*ones(1,21);
y2 = load('ber_QPSK.txt');
y3 = load('ber_QPSK_chaos.txt');
y4 = load('ber_QPSK_chaos_viterbi.txt');
semilogy(x,y1,'r+-');
axis([0 10 10e-04 1]);
hold on;
semilogy(x,y2,'b^-');
semilogy(x,y3,'ko-');
semilogy(x,y4,'gd-');


xlabel('信噪比 Eb/no')
ylabel('误码率 BER')

% Specified in plot order
legend('非法接收方','QPSK理论性能','合法接收方（无信道编码）','合法接收方（卷积码）')

end


%% AWGN 数据来源

if 1

x = 0:0.5:10;
y1 = 0.5*ones(1,21);

if 0
y2  = zeros(1,21);
    for i=1:21 
        y2(i)=ofdm((i-1)/2);
    end    
save ber_QPSK.txt y2 -ascii;
end

if 0
y3  = zeros(1,21);
    for i=1:21 
        y3(i)=ofdm_chaos((i-1)/2);
    end    
save ber_QPSK_chaos.txt y3 -ascii;
end

end
if 0
    
    y4  = zeros(1,21);
    for i=1:21 
        y4(i)=ofdm_viterbi((i-1)/2);
    end    
save ber_QPSK_chaos_viterbi.txt y4 -ascii;
    

end




%axis([0 10 0 1]);
%set(gca,'ytick',[0:2:10]);
%set(gca,'YtickLabel',{'0','10^(-4)','10^(-3)','10^(-2)','10^(0)'});

%% 瑞丽衰落 数据来源

if 0

x = 0:0.5:10;
y1 = 0.5*ones(1,21);

if 1
y2  = zeros(1,21);
    for i=1:21 
        y2(i)=ofdm_fading((i-1)/2);
    end    
save ber_QPSK_fading.txt y2 -ascii;
end

if 1
y3  = zeros(1,21);
    for i=1:21 
        y3(i)=ofdm_fading_chaos((i-1)/2);
    end    
save ber_QPSK_fading_chaos.txt y3 -ascii;
end

end

%% 瑞丽衰落的误码性能

if 0

figure(2);

x = 0:0.5:10;
y1 = 0.5*ones(1,21);
y2 = load('ber_QPSK_fading.txt');
y3 = load('ber_QPSK_fading_chaos.txt');
semilogy(x,y1,'r+-');
hold on;
semilogy(x,y2,'b^-');
semilogy(x,y3,'ko-');


xlabel('信噪比 Eb/no')
ylabel('误码率 BER')

% Specified in plot order
legend('非法接收方','QPSK理论性能','合法接收方（无信道编码）')

end


%% tent + AWGN数据初始化 
if 0
x = 0:0.5:10;
y1 = 0.5*ones(1,21);

if 0
y2  = zeros(1,21);
    for i=1:21 
        y2(i)=ofdm_chaos((i-1)/2);
    end    
save ber_QPSK_chaos_tent.txt y2 -ascii;
end

end

%% 对比tent和logistic

if 0
    
figure(3);

x = 0:0.5:10;
y1 = 0.5*ones(1,21);
y2 = load('ber_QPSK_chaos.txt');
y3 = load('ber_QPSK_chaos_tent.txt');
semilogy(x,y1,'r+-');
hold on;
semilogy(x,y2,'b^-');
semilogy(x,y3,'ko-');


xlabel('信噪比 Eb/no')
ylabel('误码率 BER')

% Specified in plot order
legend('非法接收方','合法接收方(logistic)','合法接收方(tent)')

end

