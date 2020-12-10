function dif=dif_chain_code(cc)
 
[M,N]=size(cc);
 
for i=1:N-1
    dif(i)=mod((cc(i+1)-cc(i)),8);
end
 
dif(N)=mod((cc(1)-cc(end)),8);
