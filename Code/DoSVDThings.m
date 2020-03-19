function [u,s,v]=DoSVDThings(X,DataName,time);
DataRank=rank(X); % Computing rank
[m,n]=size(X); % compute data size
mn=mean(X,1); % compute mean for each column
X=X-repmat(mn',1,size(X,1))'; % subtract mean from X
[u,s,v]=svd(X/sqrt(n-1),'econ'); % perform the SVD
figure(101)
hold on
rbrg={{"k"};{"b"};{"r"};{"ok"};{"ob"};{"or"};{"xk"};{"xb"};{"xr"};{"k"};{"b"};{"r"};{"k"};{"b"};{"r"};{"k"};{"b"};{"r"}};
plot(1:size(s,1),diag(s).^.5,rbrg{randi(9)}{1});

xlabel('Mode')
ylabel('Energy')
title('Power by Orthogonal Mode')
%% Lo-Rank
nfeat=size(v,1);
fct=nfeat;

for f=1:size(v,2);
[val ind] = sort(s(:,f),'descend');
mainfeat(f,:)=ind(1:fct);
end
indd=mainfeat(1:fct,:);
upl=u(:,indd);

end
