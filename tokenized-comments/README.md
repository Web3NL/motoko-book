# Tokenized Comments on the Internet Computer
## **Experimental** crypto-economically moderated Web3 comments system
Tokenized Comments is an example project for the Motoko Programming Language Book that demonstrates the use of an ICRC-1 token to moderate an online comments section. 

### Design choices

**Commenting**
- Any authenticated user can place a comment

- Any authenticated user can either like, dislike or report a comment

- A reported comment is removed from main list and placed on reported list

- Any authenticated user can confirm report a comment on the reported list 

- Comments older than one month are deleted

**Rewards**
- Commenting, liking, disliking, reporting and confirm reporting are rewarded equally

- A commenter is rewarded if the comment turns controversial within a time frame.

- Likers or dislikers are rewarded only if they turn a controversial comment into a non-controversial comment within a time frame

- A controversial comment does not display likes and dislikes

- A controversial comment is one that has a minimum amount of likes plus dislikes where the difference is smaller than a predefined constant. 

$$ 
\begin{aligned}
total &= likes + dislikes \\
threshold &= 0.5 \\  

diff &= \bigg | \frac{likes}{total} - \frac{dislikes}{total} \bigg | \\

controversial &= diff < threshold
\end{aligned}
$$

- Reporters and confirm reporters are rewarded on a first come first serve basis with a maximum number of voters

- Reporters who's report is reverted, wont be rewarded for a week. 

- Reporting results are revealed after voting period


## Data models
- Comment
    - Principal
    - Text
    - Date

- Like

- Dislike

- Report

- ConfirmReport