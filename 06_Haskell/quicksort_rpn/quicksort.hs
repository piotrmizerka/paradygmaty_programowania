-- this classes is prepared based on: https://learnyouahaskell.github.io/chapters.html

densityTellWhere :: (RealFloat a) => a -> a -> String  
densityTellWhere mass volume  
    | density < air = "Wow! You're going for a ride in the sky!"  
    | density <= water = "Have fun swimming, but watch out for sharks!"  
    | otherwise   = "If it's sink or swim, you're going to sink."  
    where density = mass / volume  
          air = 1.2  
          water = 1000.0 

densityTellLet :: (RealFloat a) => a -> a -> String
densityTellLet mass volume =
    let density = mass / volume
        air = 1.2
        water = 1000.0
    in if density < air
       then "Wow! You're going for a ride in the sky!"
       else if density <= water then "Have fun swimming, but watch out for sharks!"
       else "If it's sink or swim, you're going to sink."

-- TODO: wyjasnij skladnie "densityTellLet :: (RealFloat a) => a -> a -> String"

-- TODO: zaimplementuj quicksort w dwoch wersjach: z uzyciem guardow i z uzyciem let-in