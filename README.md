 # 🎱 Ball Eater — Onchain Game          
          
A fully onchain PvP game where **balls eat each other to grow**.         
Written in pure Solidity. No tokens. No rewards. Just strategy and survival.         
       
---       
          
## 🧠 Gameplay        
        
- Each player can **spawn a ball** with a chosen radius (1–100).           
- If your ball is **larger than someone else's**, you can **eat** it.          
- When you eat a ball, its radius is **added** to yours.      
- The eaten player is eliminated.         
- The biggest ball wins... or becomes the next target 🧨            
       
---      
         
## ✍️ Smart Contract           
      
- Language: Solidity ^0.8.24        
- Gas-optimized, minimalistic    
- No offchain components      
- Transparent, deterministic PvP     
   
---  
  
## 🚀 How to Play (using Remix)   
 
1. Open [Remix IDE](https://remix.ethereum.org/)   
2. Paste `BallEater.sol` into a new file   
3. Deploy the contract using any test network   
4. Interact via:  
   - `createBall(uint)` – create your ball   
   - `eatBall(address)` – eat a smaller ball  
   - `getMyRadius()` – check your current size  

---

## 🧪 Example

```solidity
createBall(30)        // Player A
createBall(20)        // Player B
eatBall(Player_B)     // Player A eats Player B and grows to 50
