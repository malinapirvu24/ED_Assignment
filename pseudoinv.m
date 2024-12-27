%% Compute the pseudo-inverse of the HtH for CRLB

H = ones(10, 2);
HtH = H' * H;

% SVD
[U, S, V] = svd(HtH);
for i = 1:size(S)
    if S(i, i) > 1e-10  % small numbers
        S_inv(i, i) = 1 / S(i, i);
    end
end

% pseudo-inverse
HtH_pseudo_inverse = V * S_inv * U';

% check if HtH * HtH+ * HtH = HtH
reconstructed_HtH = HtH * HtH_pseudo_inverse * HtH;

% compare results
disp(HtH);
disp(reconstructed_HtH);
disp(HtH_pseudo_inverse);