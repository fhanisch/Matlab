function out = random3d (pos, seed)
  x = sin(dot(pos,[12.9898;78.233;189.39581]) + seed) * 43758.5453123;
  out = x - floor(x);
end
