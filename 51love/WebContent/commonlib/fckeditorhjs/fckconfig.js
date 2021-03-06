/ *  
   *   F C K e d i t o r   -   T h e   t e x t   e d i t o r   f o r   I n t e r n e t   -   h t t p : / / w w w . f c k e d i t o r . n e t  
   *   C o p y r i g h t   ( C )   2 0 0 3 - 2 0 0 7   F r e d e r i c o   C a l d e i r a   K n a b b e n  
   *  
   *   = =   B E G I N   L I C E N S E   = =  
   *  
   *   L i c e n s e d   u n d e r   t h e   t e r m s   o f   a n y   o f   t h e   f o l l o w i n g   l i c e n s e s   a t   y o u r  
   *   c h o i c e :  
   *  
   *     -   G N U   G e n e r a l   P u b l i c   L i c e n s e   V e r s i o n   2   o r   l a t e r   ( t h e   " G P L " )  
   *         h t t p : / / w w w . g n u . o r g / l i c e n s e s / g p l . h t m l  
   *  
   *     -   G N U   L e s s e r   G e n e r a l   P u b l i c   L i c e n s e   V e r s i o n   2 . 1   o r   l a t e r   ( t h e   " L G P L " )  
   *         h t t p : / / w w w . g n u . o r g / l i c e n s e s / l g p l . h t m l  
   *  
   *     -   M o z i l l a   P u b l i c   L i c e n s e   V e r s i o n   1 . 1   o r   l a t e r   ( t h e   " M P L " )  
   *         h t t p : / / w w w . m o z i l l a . o r g / M P L / M P L - 1 . 1 . h t m l  
   *  
   *   = =   E N D   L I C E N S E   = =  
   *  
   *   E d i t o r   c o n f i g u r a t i o n   s e t t i n g s .  
   *  
   *   F o l l o w   t h i s   l i n k   f o r   m o r e   i n f o r m a t i o n :  
   *   h t t p : / / w i k i . f c k e d i t o r . n e t / D e v e l o p e r % 2 7 s _ G u i d e / C o n f i g u r a t i o n / C o n f i g u r a t i o n s _ S e t t i n g s  
   * /  
  
 / /   D i s a b l e   t h e   c u s t o m   E n t e r   K e y   H a n d l e r .   T h i s   o p t i o n   w i l l   b e   r e m o v e d   i n   v e r s i o n   2 . 5 .  
 F C K C o n f i g . D i s a b l e E n t e r K e y H a n d l e r   =   f a l s e   ;  
  
 F C K C o n f i g . C u s t o m C o n f i g u r a t i o n s P a t h   =   ' '   ;  
  
 F C K C o n f i g . E d i t o r A r e a C S S   =   F C K C o n f i g . B a s e P a t h   +   ' c s s / f c k _ e d i t o r a r e a . c s s '   ;  
 F C K C o n f i g . T o o l b a r C o m b o P r e v i e w C S S   =   ' '   ;  
  
 F C K C o n f i g . D o c T y p e   =   ' '   ;  
  
 F C K C o n f i g . B a s e H r e f   =   ' '   ;  
  
 F C K C o n f i g . F u l l P a g e   =   f a l s e   ;  
  
 F C K C o n f i g . D e b u g   =   f a l s e   ;  
 F C K C o n f i g . A l l o w Q u e r y S t r i n g D e b u g   =   t r u e   ;  
  
 F C K C o n f i g . S k i n P a t h   =   F C K C o n f i g . B a s e P a t h   +   ' s k i n s / d e f a u l t / '   ;  
 F C K C o n f i g . P r e l o a d I m a g e s   =   [   F C K C o n f i g . S k i n P a t h   +   ' i m a g e s / t o o l b a r . s t a r t . g i f ' ,   F C K C o n f i g . S k i n P a t h   +   ' i m a g e s / t o o l b a r . b u t t o n a r r o w . g i f '   ]   ;  
  
 F C K C o n f i g . P l u g i n s P a t h   =   F C K C o n f i g . B a s e P a t h   +   ' p l u g i n s / '   ;  
  
 / /   F C K C o n f i g . P l u g i n s . A d d (   ' a u t o g r o w '   )   ;  
 F C K C o n f i g . A u t o G r o w M a x   =   4 0 0   ;  
  
 / /   F C K C o n f i g . P r o t e c t e d S o u r c e . A d d (   / < % [ \ s \ S ] * ? % > / g   )   ; 	 / /   A S P   s t y l e   s e r v e r   s i d e   c o d e   < % . . . % >  
 / /   F C K C o n f i g . P r o t e c t e d S o u r c e . A d d (   / < \ ? [ \ s \ S ] * ? \ ? > / g   )   ; 	 / /   P H P   s t y l e   s e r v e r   s i d e   c o d e  
 / /   F C K C o n f i g . P r o t e c t e d S o u r c e . A d d (   / ( < a s p : [ ^ \ > ] + > [ \ s | \ S ] * ? < \ / a s p : [ ^ \ > ] + > ) | ( < a s p : [ ^ \ > ] + \ / > ) / g i   )   ; 	 / /   A S P . N e t   s t y l e   t a g s   < a s p : c o n t r o l >  
  
 F C K C o n f i g . A u t o D e t e c t L a n g u a g e 	 =   t r u e   ;  
 F C K C o n f i g . D e f a u l t L a n g u a g e 	 	 =   ' z h - c n '   ;  
 F C K C o n f i g . C o n t e n t L a n g D i r e c t i o n 	 =   ' l t r '   ;  
  
 F C K C o n f i g . P r o c e s s H T M L E n t i t i e s 	 =   t r u e   ;  
 F C K C o n f i g . I n c l u d e L a t i n E n t i t i e s 	 =   t r u e   ;  
 F C K C o n f i g . I n c l u d e G r e e k E n t i t i e s 	 =   t r u e   ;  
  
 F C K C o n f i g . P r o c e s s N u m e r i c E n t i t i e s   =   f a l s e   ;  
  
 F C K C o n f i g . A d d i t i o n a l N u m e r i c E n t i t i e s   =   ' '     ; 	 	 / /   S i n g l e   Q u o t e :   " ' "  
  
 F C K C o n f i g . F i l l E m p t y B l o c k s 	 =   t r u e   ;  
  
 F C K C o n f i g . F o r m a t S o u r c e 	 	 =   t r u e   ;  
 F C K C o n f i g . F o r m a t O u t p u t 	 	 =   t r u e   ;  
 F C K C o n f i g . F o r m a t I n d e n t a t o r 	 =   '         '   ;  
  
 F C K C o n f i g . F o r c e S t r o n g E m   =   t r u e   ;  
 F C K C o n f i g . G e c k o U s e S P A N 	 =   f a l s e   ;  
 F C K C o n f i g . S t a r t u p F o c u s 	 =   f a l s e   ;  
 F C K C o n f i g . F o r c e P a s t e A s P l a i n T e x t 	 =   f a l s e   ;  
 F C K C o n f i g . A u t o D e t e c t P a s t e F r o m W o r d   =   t r u e   ; 	 / /   I E   o n l y .  
 F C K C o n f i g . F o r c e S i m p l e A m p e r s a n d 	 =   f a l s e   ;  
 F C K C o n f i g . T a b S p a c e s 	 	 =   0   ;  
 F C K C o n f i g . S h o w B o r d e r s 	 =   t r u e   ;  
 F C K C o n f i g . S o u r c e P o p u p 	 =   f a l s e   ;  
 F C K C o n f i g . T o o l b a r S t a r t E x p a n d e d 	 =   t r u e   ;  
 F C K C o n f i g . T o o l b a r C a n C o l l a p s e 	 =   t r u e   ;  
 F C K C o n f i g . I g n o r e E m p t y P a r a g r a p h V a l u e   =   t r u e   ;  
 F C K C o n f i g . P r e s e r v e S e s s i o n O n F i l e B r o w s e r   =   f a l s e   ;  
 F C K C o n f i g . F l o a t i n g P a n e l s Z I n d e x   =   1 0 0 0 0   ;  
  
 F C K C o n f i g . T e m p l a t e R e p l a c e A l l   =   t r u e   ;  
 F C K C o n f i g . T e m p l a t e R e p l a c e C h e c k b o x   =   t r u e   ;  
  
 F C K C o n f i g . T o o l b a r L o c a t i o n   =   ' I n '   ;  
  
 F C K C o n f i g . T o o l b a r S e t s [ " D e f a u l t " ]   =   [  
 	 [ ' I m a g e ' ]  
 ]   ;  
 F C K C o n f i g . T o o l b a r S e t s [ " N O N E T O O L " ]   =   [  
 ]   ;  
  
 F C K C o n f i g . T o o l b a r S e t s [ " B a s i c " ]   =   [  
 	 [ ' B o l d ' , ' I t a l i c ' , ' - ' , ' O r d e r e d L i s t ' , ' U n o r d e r e d L i s t ' , ' - ' , ' L i n k ' , ' U n l i n k ' , ' - ' , ' A b o u t ' ]  
 ]   ;  
  
 F C K C o n f i g . E n t e r M o d e   =   ' p '   ; 	 	 	 / /   p   |   d i v   |   b r  
 F C K C o n f i g . S h i f t E n t e r M o d e   =   ' b r '   ; 	 / /   p   |   d i v   |   b r  
  
 F C K C o n f i g . K e y s t r o k e s   =   [  
 	 [   C T R L   +   6 5   / * A * / ,   t r u e   ] ,  
 	 [   C T R L   +   6 7   / * C * / ,   t r u e   ] ,  
 	 [   C T R L   +   7 0   / * F * / ,   t r u e   ] ,  
 	 [   C T R L   +   8 3   / * S * / ,   t r u e   ] ,  
 	 [   C T R L   +   8 8   / * X * / ,   t r u e   ] ,  
 	 [   C T R L   +   8 6   / * V * / ,   ' P a s t e '   ] ,  
 	 [   S H I F T   +   4 5   / * I N S * / ,   ' P a s t e '   ] ,  
 	 [   C T R L   +   9 0   / * Z * / ,   ' U n d o '   ] ,  
 	 [   C T R L   +   8 9   / * Y * / ,   ' R e d o '   ] ,  
 	 [   C T R L   +   S H I F T   +   9 0   / * Z * / ,   ' R e d o '   ] ,  
 	 [   C T R L   +   7 6   / * L * / ,   ' L i n k '   ] ,  
 	 [   C T R L   +   6 6   / * B * / ,   ' B o l d '   ] ,  
 	 [   C T R L   +   7 3   / * I * / ,   ' I t a l i c '   ] ,  
 	 [   C T R L   +   8 5   / * U * / ,   ' U n d e r l i n e '   ] ,  
 	 [   C T R L   +   S H I F T   +   8 3   / * S * / ,   ' S a v e '   ] ,  
 	 [   C T R L   +   A L T   +   1 3   / * E N T E R * / ,   ' F i t W i n d o w '   ] ,  
 	 [   C T R L   +   9   / * T A B * / ,   ' S o u r c e '   ]  
 ]   ;  
  
 F C K C o n f i g . C o n t e x t M e n u   =   [ ' G e n e r i c ' , ' L i n k ' , ' A n c h o r ' , ' I m a g e ' , ' F l a s h ' , ' S e l e c t ' , ' T e x t a r e a ' , ' C h e c k b o x ' , ' R a d i o ' , ' T e x t F i e l d ' , ' H i d d e n F i e l d ' , ' I m a g e B u t t o n ' , ' B u t t o n ' , ' B u l l e t e d L i s t ' , ' N u m b e r e d L i s t ' , ' T a b l e ' , ' F o r m ' ]   ;  
  
 F C K C o n f i g . F o n t C o l o r s   =   ' 0 0 0 0 0 0 , 9 9 3 3 0 0 , 3 3 3 3 0 0 , 0 0 3 3 0 0 , 0 0 3 3 6 6 , 0 0 0 0 8 0 , 3 3 3 3 9 9 , 3 3 3 3 3 3 , 8 0 0 0 0 0 , F F 6 6 0 0 , 8 0 8 0 0 0 , 8 0 8 0 8 0 , 0 0 8 0 8 0 , 0 0 0 0 F F , 6 6 6 6 9 9 , 8 0 8 0 8 0 , F F 0 0 0 0 , F F 9 9 0 0 , 9 9 C C 0 0 , 3 3 9 9 6 6 , 3 3 C C C C , 3 3 6 6 F F , 8 0 0 0 8 0 , 9 9 9 9 9 9 , F F 0 0 F F , F F C C 0 0 , F F F F 0 0 , 0 0 F F 0 0 , 0 0 F F F F , 0 0 C C F F , 9 9 3 3 6 6 , C 0 C 0 C 0 , F F 9 9 C C , F F C C 9 9 , F F F F 9 9 , C C F F C C , C C F F F F , 9 9 C C F F , C C 9 9 F F , F F F F F F '   ;  
  
 F C K C o n f i g . F o n t N a m e s 	 	 =   ' �[SO; ўSO; ��fN; wiSO_ G B 2 3 1 2 ; A r i a l ; C o m i c   S a n s   M S ; C o u r i e r   N e w ; T a h o m a ; T i m e s   N e w   R o m a n ; V e r d a n a '   ;  
 F C K C o n f i g . F o n t S i z e s 	 	 =   ' 1 / x x - s m a l l ; 2 / x - s m a l l ; 3 / s m a l l ; 4 / m e d i u m ; 5 / l a r g e ; 6 / x - l a r g e ; 7 / x x - l a r g e '   ;  
 F C K C o n f i g . F o n t F o r m a t s 	 =   ' p ; d i v ; p r e ; a d d r e s s ; h 1 ; h 2 ; h 3 ; h 4 ; h 5 ; h 6 '   ;  
  
 F C K C o n f i g . S t y l e s X m l P a t h 	 	 =   F C K C o n f i g . E d i t o r P a t h   +   ' f c k s t y l e s . x m l '   ;  
 F C K C o n f i g . T e m p l a t e s X m l P a t h 	 =   F C K C o n f i g . E d i t o r P a t h   +   ' f c k t e m p l a t e s . x m l '   ;  
  
 F C K C o n f i g . S p e l l C h e c k e r 	 	 	 =   ' i e S p e l l '   ; 	 / /   ' i e S p e l l '   |   ' S p e l l e r P a g e s '  
 F C K C o n f i g . I e S p e l l D o w n l o a d U r l 	 =   ' h t t p : / / w w w . i e s p e l l . c o m / d o w n l o a d . p h p '   ;  
 F C K C o n f i g . S p e l l e r P a g e s S e r v e r S c r i p t   =   ' s e r v e r - s c r i p t s / s p e l l c h e c k e r . p h p '   ; 	 / /   A v a i l a b l e   e x t e n s i o n :   . p h p   . c f m   . p l  
  
 F C K C o n f i g . M a x U n d o L e v e l s   =   1 5   ;  
  
 F C K C o n f i g . D i s a b l e O b j e c t R e s i z i n g   =   f a l s e   ;  
 F C K C o n f i g . D i s a b l e F F T a b l e H a n d l e s   =   t r u e   ;  
  
 F C K C o n f i g . L i n k D l g H i d e T a r g e t 	 	 =   f a l s e   ;  
 F C K C o n f i g . L i n k D l g H i d e A d v a n c e d 	 =   f a l s e   ;  
  
 F C K C o n f i g . I m a g e D l g H i d e L i n k 	 	 =   f a l s e   ;  
 F C K C o n f i g . I m a g e D l g H i d e A d v a n c e d 	 =   f a l s e   ;  
  
 F C K C o n f i g . F l a s h D l g H i d e A d v a n c e d 	 =   f a l s e   ;  
  
 F C K C o n f i g . P r o t e c t e d T a g s   =   ' '   ;  
  
 / /   T h i s   w i l l   b e   a p p l i e d   t o   t h e   b o d y   e l e m e n t   o f   t h e   e d i t o r  
 F C K C o n f i g . B o d y I d   =   ' '   ;  
 F C K C o n f i g . B o d y C l a s s   =   ' '   ;  
  
 / /   T h e   o p t i o n   s w i t c h e s   b e t w e e n   t r y i n g   t o   k e e p   t h e   h t m l   s t r u c t u r e   o r   d o   t h e   c h a n g e s   s o   t h e   c o n t e n t   l o o k s   l i k e   i t   w a s   i n   W o r d  
 F C K C o n f i g . C l e a n W o r d K e e p s S t r u c t u r e   =   f a l s e   ;  
  
 / /   T h e   f o l l o w i n g   v a l u e   d e f i n e s   w h i c h   F i l e   B r o w s e r   c o n n e c t o r   a n d   Q u i c k   U p l o a d  
 / /   " u p l o a d e r "   t o   u s e .   I t   i s   v a l i d   f o r   t h e   d e f a u l t   i m p l e m e n t a i o n   a n d   i t   i s   h e r e  
 / /   j u s t   t o   m a k e   t h i s   c o n f i g u r a t i o n   f i l e   c l e a n e r .  
 / /   I t   i s   n o t   p o s s i b l e   t o   c h a n g e   t h i s   v a l u e   u s i n g   a n   e x t e r n a l   f i l e   o r   e v e n  
 / /   i n l i n e   w h e n   c r e a t i n g   t h e   e d i t o r   i n s t a n c e .   I n   t h a t   c a s e s   y o u   m u s t   s e t   t h e  
 / /   v a l u e s   o f   L i n k B r o w s e r U R L ,   I m a g e B r o w s e r U R L   a n d   s o   o n .  
 / /   C u s t o m   i m p l e m e n t a t i o n s   s h o u l d   j u s t   i g n o r e   i t .  
 v a r   _ F i l e B r o w s e r L a n g u a g e 	 =   ' a s p '   ; 	 / /   a s p   |   a s p x   |   c f m   |   l a s s o   |   p e r l   |   p h p   |   p y  
 v a r   _ Q u i c k U p l o a d L a n g u a g e 	 =   ' a s p '   ; 	 / /   a s p   |   a s p x   |   c f m   |   l a s s o   |   p h p  
  
  
 / /   D o n ' t   c a r e   a b o u t   t h e   f o l l o w i n g   l i n e .   I t   j u s t   c a l c u l a t e s   t h e   c o r r e c t   c o n n e c t o r  
 / /   e x t e n s i o n   t o   u s e   f o r   t h e   d e f a u l t   F i l e   B r o w s e r   ( P e r l   u s e s   " c g i " ) .  
 v a r   _ F i l e B r o w s e r E x t e n s i o n   =   _ F i l e B r o w s e r L a n g u a g e   = =   ' p e r l '   ?   ' c g i '   :   _ F i l e B r o w s e r L a n g u a g e   ;  
  
 F C K C o n f i g . L i n k B r o w s e r   =   t r u e   ;  
 F C K C o n f i g . L i n k B r o w s e r U R L   =   F C K C o n f i g . B a s e P a t h   +   ' f i l e m a n a g e r / b r o w s e r / d e f a u l t / b r o w s e r . h t m l ? C o n n e c t o r = c o n n e c t o r s / j s p / c o n n e c t o r '   ;  
 F C K C o n f i g . L i n k B r o w s e r W i n d o w W i d t h 	 =   F C K C o n f i g . S c r e e n W i d t h   *   0 . 7   ; 	 	 / /   7 0 %  
 F C K C o n f i g . L i n k B r o w s e r W i n d o w H e i g h t 	 =   F C K C o n f i g . S c r e e n H e i g h t   *   0 . 7   ; 	 / /   7 0 %  
  
 F C K C o n f i g . I m a g e B r o w s e r   =   t r u e   ;  
 F C K C o n f i g . I m a g e B r o w s e r U R L   =   F C K C o n f i g . B a s e P a t h   +   ' f i l e m a n a g e r / b r o w s e r / d e f a u l t / b r o w s e r . h t m l ? T y p e = I m a g e & C o n n e c t o r = c o n n e c t o r s / j s p / c o n n e c t o r ' ;  
 F C K C o n f i g . I m a g e B r o w s e r W i n d o w W i d t h     =   F C K C o n f i g . S c r e e n W i d t h   *   0 . 7   ; 	 / /   7 0 %   ;  
 F C K C o n f i g . I m a g e B r o w s e r W i n d o w H e i g h t   =   F C K C o n f i g . S c r e e n H e i g h t   *   0 . 7   ; 	 / /   7 0 %   ;  
  
 F C K C o n f i g . F l a s h B r o w s e r   =   t r u e   ;  
 F C K C o n f i g . F l a s h B r o w s e r U R L   =   F C K C o n f i g . B a s e P a t h   +   ' f i l e m a n a g e r / b r o w s e r / d e f a u l t / b r o w s e r . h t m l ? T y p e = F l a s h & C o n n e c t o r = c o n n e c t o r s / j s p / c o n n e c t o r '   ;  
 F C K C o n f i g . F l a s h B r o w s e r W i n d o w W i d t h     =   F C K C o n f i g . S c r e e n W i d t h   *   0 . 7   ; 	 / / 7 0 %   ;  
 F C K C o n f i g . F l a s h B r o w s e r W i n d o w H e i g h t   =   F C K C o n f i g . S c r e e n H e i g h t   *   0 . 7   ; 	 / / 7 0 %   ;  
  
 F C K C o n f i g . L i n k U p l o a d   =   t r u e   ;  
 F C K C o n f i g . L i n k U p l o a d U R L   =   F C K C o n f i g . B a s e P a t h   +   ' f i l e m a n a g e r / u p l o a d / s i m p l e u p l o a d e r ? T y p e = F i l e '   ;  
 F C K C o n f i g . L i n k U p l o a d A l l o w e d E x t e n s i o n s 	 =   " "   ; 	 	 	 / /   e m p t y   f o r   a l l  
 F C K C o n f i g . L i n k U p l o a d D e n i e d E x t e n s i o n s 	 =   " . ( h t m l | h t m | p h p | p h p 2 | p h p 3 | p h p 4 | p h p 5 | p h t m l | p w m l | i n c | a s p | a s p x | a s c x | j s p | c f m | c f c | p l | b a t | e x e | c o m | d l l | v b s | j s | r e g | c g i | h t a c c e s s | a s i s ) $ "   ; 	 / /   e m p t y   f o r   n o   o n e  
  
 F C K C o n f i g . I m a g e U p l o a d   =   t r u e   ;  
 F C K C o n f i g . I m a g e U p l o a d U R L   =   F C K C o n f i g . B a s e P a t h   +   ' f i l e m a n a g e r / u p l o a d / s i m p l e u p l o a d e r ? T y p e = I m a g e '   ;  
 F C K C o n f i g . I m a g e U p l o a d A l l o w e d E x t e n s i o n s 	 =   " . ( j p g | g i f | j p e g | p n g | b m p ) $ "   ; 	 	 / /   e m p t y   f o r   a l l  
 F C K C o n f i g . I m a g e U p l o a d D e n i e d E x t e n s i o n s 	 =   " "   ; 	 	 	 	 	 	 	 / /   e m p t y   f o r   n o   o n e  
  
 F C K C o n f i g . F l a s h U p l o a d   =   t r u e   ;  
 F C K C o n f i g . F l a s h U p l o a d U R L   =   F C K C o n f i g . B a s e P a t h   +   ' f i l e m a n a g e r / u p l o a d / s i m p l e u p l o a d e r ? T y p e = F l a s h '   ;  
 F C K C o n f i g . F l a s h U p l o a d A l l o w e d E x t e n s i o n s 	 =   " . ( s w f | f l a ) $ "   ; 	 	 / /   e m p t y   f o r   a l l  
 F C K C o n f i g . F l a s h U p l o a d D e n i e d E x t e n s i o n s 	 =   " "   ; 	 	 	 	 	 / /   e m p t y   f o r   n o   o n e  
  
 F C K C o n f i g . S m i l e y P a t h 	 =   F C K C o n f i g . B a s e P a t h   +   ' i m a g e s / s m i l e y / m s n / '   ;  
 F C K C o n f i g . S m i l e y I m a g e s 	 =   [ ' r e g u l a r _ s m i l e . g i f ' , ' s a d _ s m i l e . g i f ' , ' w i n k _ s m i l e . g i f ' , ' t e e t h _ s m i l e . g i f ' , ' c o n f u s e d _ s m i l e . g i f ' , ' t o u n g e _ s m i l e . g i f ' , ' e m b a r e s s e d _ s m i l e . g i f ' , ' o m g _ s m i l e . g i f ' , ' w h a t c h u t a l k i n g a b o u t _ s m i l e . g i f ' , ' a n g r y _ s m i l e . g i f ' , ' a n g e l _ s m i l e . g i f ' , ' s h a d e s _ s m i l e . g i f ' , ' d e v i l _ s m i l e . g i f ' , ' c r y _ s m i l e . g i f ' , ' l i g h t b u l b . g i f ' , ' t h u m b s _ d o w n . g i f ' , ' t h u m b s _ u p . g i f ' , ' h e a r t . g i f ' , ' b r o k e n _ h e a r t . g i f ' , ' k i s s . g i f ' , ' e n v e l o p e . g i f ' ]   ;  
 F C K C o n f i g . S m i l e y C o l u m n s   =   8   ;  
 F C K C o n f i g . S m i l e y W i n d o w W i d t h 	 	 =   3 2 0   ;  
 F C K C o n f i g . S m i l e y W i n d o w H e i g h t 	 =   2 4 0   ;  
 F C K C o n f i g . T o o l b a r S e t s [ " U s a b l e " ]   =   [  
         [ ' S o u r c e ' , ' P r e v i e w ' ] ,  
         [ ' U n d o ' , ' R e d o ' , ' - ' , ' S e l e c t A l l ' , ' C u t ' , ' C o p y ' , ' P a s t e ' , ' - ' , ' R e m o v e F o r m a t ' , ' - ' , ' F i n d ' , ' R e p l a c e ' ] ,  
         [ ' L i n k ' , ' U n l i n k ' , ' A n c h o r ' ] ,  
         [ ' F i t W i n d o w ' , ' - ' , ' A b o u t ' ] ,  
         ' / ' ,  
         [ ' B o l d ' , ' I t a l i c ' , ' U n d e r l i n e ' , ' S t r i k e T h r o u g h ' , ' - ' , ' S u b s c r i p t ' , ' S u p e r s c r i p t ' ] ,  
         [ ' O r d e r e d L i s t ' , ' U n o r d e r e d L i s t ' , ' - ' , ' O u t d e n t ' , ' I n d e n t ' ] ,  
         [ ' J u s t i f y L e f t ' , ' J u s t i f y C e n t e r ' , ' J u s t i f y R i g h t ' , ' J u s t i f y F u l l ' ] ,  
         [ ' I m a g e ' , ' F l a s h ' , ' T a b l e ' , ' R u l e ' , ' S m i l e y ' ] ,  
         ' / ' ,  
         [ ' S t y l e ' , ' F o n t F o r m a t ' , ' F o n t N a m e ' , ' F o n t S i z e ' ] ,  
         [ ' T e x t C o l o r ' , ' B G C o l o r ' ]  
 ]   ;  
 F C K C o n f i g . T o o l b a r S e t s [ " S i m p l e " ]   =   [  
         [ ' S o u r c e ' , ' P r e v i e w ' ] ,  
         [ ' U n d o ' , ' R e d o ' , ' - ' , ' S e l e c t A l l ' , ' C u t ' , ' C o p y ' , ' P a s t e ' , ' - ' , ' R e m o v e F o r m a t ' , ' - ' , ' F i n d ' , ' R e p l a c e ' ] ,  
         [ ' A n c h o r ' ] ,  
         [ ' F i t W i n d o w ' , ' - ' ] ,  
         ' / ' ,  
         [ ' B o l d ' , ' I t a l i c ' , ' U n d e r l i n e ' , ' S t r i k e T h r o u g h ' , ' - ' , ' S u b s c r i p t ' , ' S u p e r s c r i p t ' ] ,  
         [ ' O r d e r e d L i s t ' , ' U n o r d e r e d L i s t ' , ' - ' , ' O u t d e n t ' , ' I n d e n t ' ] ,  
         [ ' J u s t i f y L e f t ' , ' J u s t i f y C e n t e r ' , ' J u s t i f y R i g h t ' , ' J u s t i f y F u l l ' ] ,  
         [ ' T a b l e ' , ' R u l e ' , ' S m i l e y ' ] ,  
         ' / ' ,  
         [ ' S t y l e ' , ' F o n t F o r m a t ' , ' F o n t N a m e ' , ' F o n t S i z e ' ] ,  
         [ ' T e x t C o l o r ' , ' B G C o l o r ' ]  
 ]   ; 