function [g_ik] = discFunc(W, x_ik)
g_ik = 1/(1+exp(-W*x_ik));
end

