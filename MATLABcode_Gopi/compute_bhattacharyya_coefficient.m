function k = compute_bhattacharyya_coefficient(p,q)
%function to compute bhattacharyya coefficeint with object model and target
%model

k = sum(sqrt(q.*p));