# 💥 The DAO $60M hack - Reproduced in Solidity 0.8.26

[![Solidity](https://img.shields.io/badge/Solidity-0.8.26-blue)](https://soliditylang.org)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/M4LT3REG0/reentrancy-attack-demo/blob/main/LICENSE)

**Educational demonstration of the infamous **Reentrancy Attack** that stole $60M from The DAO (2016)**

## 🎯 What is Reentrancy Attack?

**The 1 smart contract vulnerability.** Contract sends ETH **BEFORE** updating internal balances, allowing malicious **BadBoy** contract to **re-enter** recursively and **drain all funds**.

🚀 ATTACK FLOW:

1. 💰 BadBoy.deposit(1 ETH) → Bank records +1 ETH credit ✅

2. 🏧 BadBoy.withdraw() → Bank sends **1 ETH** to BadBoy 💸

3. 💥 **BadBoy.fallback()** → Calls Bank.withdraw() **AGAIN** 🔄

4. 🧠 Bank thinks: "Still has credit" → Sends **ANOTHER 1 ETH** 😈

5. 🔁 **REPEATS** until **bank DRAINED** 💀

## 📁 Project Structure

reentrancy-attack-demo/
ontracts
- 🏛️ Bank.sol # 💥 Vulnerable Bank
- 😈 BadBoy.sol # 🦹 Malicious Attacker



## 💻 Step-by-Step Attack (Remix IDE)

### 1. Deploy Vulnerable Bank
Remix → contracts/Bank.sol → Deploy
Bank.getBalance() → 0 ETH

### 2. Fund Bank (Victim deposits)  
Account → Bank.deposit{value: 10+ ETH}()
Bank.getBalance() → 19 ETH ✅


### 3. Deploy BadBoy Attacker
contracts/BadBoy.sol → Constructor: [Bank address]

### 4. EXECUTE ATTACK 🔥
BadBoy.attack{value: 1 ETH}()
✅ "execution succeed"

### 🎯 **23 ETH!**

💥 Bank.getBalance() → DRENADO
💰 BadBoy Balance → 23 ETH (+1550% profit!)✅

<img width="1114" height="435" alt="image" src="https://github.com/user-attachments/assets/92ed43b1-0610-4cc2-8858-584ee2e63ad8" />


## 📚 **Learning Resources & Credits** (Links ACTUALIZADOS)

This project was inspired by these excellent educational resources:

### 🎥 **Video Tutorials**
- **[MetaDapp - Reentrancy Attack Tutorial](https://www.youtube.com/watch?v=rrvU3DSbXKo)**  
  *"Solidity - Reentrancy Attack - ¿CÓMO FUNCIONA? - EJEMPLO REAL con SOLUCIÓN"*  
  Complete Spanish tutorial with Remix demo

- **[Hack Solidity - Reentrancy Explained](https://www.youtube.com/watch?v=4Mm3BCyHtDY)**  
  *"Reentrancy | Hack Solidity"* - Classic English explanation

### 📖 **Technical Documentation**
- **[Solidity by Example - Reentrancy](https://solidity-by-example.org/hacks/re-entrancy/)**  
  Clean working example code

- **[Solidity Security Considerations](https://docs.soliditylang.org/en/latest/security-considerations.html)**  
  Official Solidity security guide

### 🏛️ **Historical Context - The DAO Hack**
- **[Wikipedia - The DAO](https://en.wikipedia.org/wiki/The_DAO)**  
  Complete history of the $60M 2016 attack

- **[Gemini Cryptopedia - The DAO Hack](https://www.gemini.com/cryptopedia/the-dao-hack-makerdao)**  
  Detailed technical explanation

### 🔬 **Security Research**
- **[OWASP Smart Contract Top 10](https://owasp.org/www-project-smart-contract-top-10/)**  
  Industry standard vulnerability ranking

## 🙏 **Acknowledgments**

**Special thanks to:**

**Cyfrin** for their amazing FREE platform  
[updraft.cyfrin.io](https://updraft.cyfrin.io/)

**[MetaDapp YouTube tutorial]([[url](https://www.youtube.com/@MetaDapp )** for the crystal-clear 
Reentrancy Attack explanation that made this complex  
vulnerability finally understandable!

**Made possible by these incredible free educational resources! 🚀**

**⭐ Implemented & documented by M4LT3REG0**
