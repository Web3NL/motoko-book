# Tokenized Comments on the Internet Computer
## **Experimental** crypto-economically moderated Web3 comments system
Tokenized Comments is an example project for the Motoko Programming Language Book that demonstrates the use of an ICRC-1 token to moderate an online comments section. 

- Every user receives an initial amount of tokens upon first login

- Any auth user can comment, like or dislike

- Likes and dislikes are initially hidden

- Every comment receives an 'engagement score' after the 'initial period'

- After initial period, likes and dislikes are revealed

- Score is calculated based on the ATH of likes for a comment. It is (likes / ATH likes) - (dislikes / ATH likes)

The following scenarios exist:
1. The comment has score lower than the moving average score
-> no one gets rewarded

1. The comment has score higher than moving average score
-> commenter get 10% reward. Likers and dislikers get 90%

1. The comment has more dislikes than allowed like / dislike ratio
Commenter and likers are slashed 10%

Expected effects:
- Commenter are rewarded for engaging and positive comments.
- Engagers, even dislikers, are rewarded for their engagement.
- Likers and dislikers are rewarded equally with the possiblity of likers being slashed


