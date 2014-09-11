function nX = normalize(x,dim,mx,mn)

% function nX = normalize(x,dim)
% 
% normalizes matrix acros the dimentions given in dim
% dim ~= 1 & dim ~= 2 normalizes across the whole matrix
% default is across the whole matrix
%
% MF 2012-02-06

if nargin<2 || isempty(dim)
    dim = 0;
end    

if dim == 1;
    nX = bsxfun(@rdivide,bsxfun(@minus,x,nanmin(x)),bsxfun(@minus,nanmax(x),nanmin(x)));
elseif dim == 2;
    x = x';
    nX = bsxfun(@rdivide,bsxfun(@minus,x,nanmin(x)),bsxfun(@minus,nanmax(x),nanmin(x)));
    nX = nX';
elseif nargin==3
    nX = (x - nanmin(x(:)))/(mx - nanmin(x(:)));
elseif nargin>3
    nX = (x - mn)/(mx - mn);
else
    nX = (x - nanmin(x(:)))/(nanmax(x(:)) - nanmin(x(:)));
end