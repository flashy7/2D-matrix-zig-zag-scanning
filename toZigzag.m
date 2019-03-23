%2D matrix zig-zag scanning (used in JPEG)

function outVector = toZigzag(inMatrix)
    right = true;
    row = 1;
    col = 1;
    outVector = 0;
    flag = false;

    while(1)
       if(row ~= size(inMatrix, 1) || col ~= size(inMatrix, 2))
           if(size(outVector, 1) == 1 && flag == false)
               outVector = inMatrix(row, col);
               flag = true;
           else
               outVector = [outVector, inMatrix(row, col)];
           end
           if(right)
              if(col < size(inMatrix, 2))
                 col = col + 1;
                 if(row > 1)
                    row = row - 1;
                 else
                    right = false; 
                 end
              else
                 right = false;
                 if(row < size(inMatrix, 1))
                    row = row + 1;
                 end
              end
           else
              if(row < size(inMatrix, 1))
                 if(col > 1)
                    col = col - 1; 
                 else
                    right = true;
                 end
                 row = row + 1;
              else
                 if(row < size(inMatrix, 1))
                    row = row + 1;
                 end
                 if(col < size(inMatrix, 2))
                    col = col + 1; 
                 end
                 right = true;
              end
           end
       else
          outVector = [outVector, inMatrix(row, col)];
          break; 
       end
    end
end

