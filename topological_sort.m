function order = topological_sort(A)
% Return the nodes in topological order (regulators before targets)

n = length(A);
indeg = zeros(1,n);
zero_indeg = []; % a vect with the nodes without parents
for i=1:n
    indeg(i) = length(parents(A,i));
  if indeg(i)==0
    zero_indeg = [i zero_indeg];
  end
end
t=1;
order = zeros(1,n);
while ~isempty(zero_indeg)
  v = zero_indeg(1); 
  zero_indeg = zero_indeg(2:end); 
  order(t) = v;
  t = t + 1;
  cs = children(A, v); 
  for j=1:length(cs)
    c = cs(j);
    indeg(c) = indeg(c) - 1;
    if indeg(c) == 0 
      zero_indeg = [c zero_indeg]; 
    end
  end
end
