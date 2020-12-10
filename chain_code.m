function code=chain_code(x,i,j)%x:pinakas i,j:arxiko pixel
 
[M,N]=size(x);
 
di=[0 -1 -1 -1 0 1 1 1];
dj=[1 1 0 -1 -1 -1 0 1];
val=x(i,j);  
n=0; %megethos alusidas
h1=0; w1=0;  
q = i;  r = j; %trexon pixel
lastdir = 4; %Proigoumeno
flag=1;
while ((q~=i) || (r~=j) || (flag==1)) 
 
       flag=0;
       m = 0; %metavliti epitixias eyresis geitonikou pixel
       dii = -1;    
       
   for ii=lastdir+1:lastdir+7 %all neighbourhood pixels
        jj = mod(ii,8); 
        if ((di(jj+1)+q)<=M) && ((dj(jj+1)+r)<=N) && (di(jj+1)+q>0) && (dj(jj+1)+r)>0  
            if ( x(di(jj+1)+q,dj(jj+1)+r) == val)  
            dii = jj;   m = 1; %perno tin kateythinsi tou pixel
            break; 
               
         end;
       end;
   end;
 
 
   if m==1%success
     if n<200 %mexri 200
         n=n+1;
         c(n) = dii; 
        q =q+ di(dii+1);    r =r+ dj(dii+1);
        lastdir = mod(dii+4,8);
    end;
        else break;
    end;
      
        if n>=200 break; end;
       
end;
           
    
   
   
if(n>0)
   code=c;
else error(sprintf('mikos alisidas: 0'));
end;
