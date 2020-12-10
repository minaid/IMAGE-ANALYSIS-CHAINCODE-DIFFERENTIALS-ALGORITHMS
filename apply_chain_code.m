function apply_chain_code
 
 
I=imread('bull.jpg');
 
I=rgb2gray(I); 
 
 
 
BW=edge(I,'canny'); 
BW1=bwareaopen(BW,35);%removes from a binary image all connected components (objects) that have fewer than P=40 pixels,
%producing another binary image
L=bwlabel(BW1);%returns a matrix L,of the same size as BW, containing labels for the connected objects in BW.
 
figure;
subplot(221);
imshow(I)
xlabel('input image(gray)');
axis equal;
subplot(222);
imshow(BW)
xlabel('Canny Filter');
axis equal;
subplot(223);
imagesc(L)
xlabel('Connected components larger than 35 Pixel');
axis equal;
 
%---------------------------
figure;imshow(BW);
hold on;
 
%--------Do chain code------
k=max(max(L));
 
for i=1:k%gia kathe perioxi i
    [xc,yc]=find(L==i);
    cc=chain_code(L,xc(1),yc(1));%chain code
    dcc=dif_chain_code(cc);%differential chain code
    plot(xc(1),yc(1),'-.r*');xlabel('Start point');
        
    disp(sprintf('\nChaincode:')); cc
    disp(sprintf('\nDifferential Chaincode:')); dcc
    disp(sprintf('\n----------------------------'));
    clear cc dcc;
end;