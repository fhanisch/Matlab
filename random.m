function out = random (n, seed)
  x = sin(n + seed) * 43758.5453123;
  out = x - floor(x);
end
