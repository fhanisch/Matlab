function out = random (p, seed)
  x = sin(p + seed) * 43758.5453123;
  out = x - floor(x);
end
