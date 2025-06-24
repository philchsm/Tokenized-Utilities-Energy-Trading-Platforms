# Tokenized Utilities Energy Trading Platform

A comprehensive blockchain-based energy trading platform built with Clarity smart contracts for the Stacks blockchain. This platform enables secure, transparent, and efficient energy trading between utility companies and energy traders.

## 🌟 Features

### Core Contracts

1. **Trader Verification Contract** (`trader-verification.clar`)
    - Validates and manages utility energy traders
    - Handles trader registration, verification, and status management
    - Manages trader permissions and capabilities

2. **Trading Coordination Contract** (`trading-coordination.clar`)
    - Coordinates energy trading between verified traders
    - Manages buy/sell orders and trade matching
    - Handles trade execution and cancellation

3. **Price Optimization Contract** (`price-optimization.clar`)
    - Optimizes energy prices based on supply and demand
    - Calculates market prices with volatility factors
    - Provides real-time price optimization

4. **Settlement Management Contract** (`settlement-management.clar`)
    - Manages trading settlements and payments
    - Handles escrow funds and balance management
    - Processes settlements with fee calculations

5. **Risk Management Contract** (`risk-management.clar`)
    - Manages trading risks and limits
    - Monitors trader risk profiles and violations
    - Implements system-wide risk controls

## 🚀 Getting Started

### Prerequisites

- Clarinet CLI installed
- Node.js and npm/yarn
- Stacks wallet for testing

### Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd energy-trading-platform
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Initialize Clarinet project:
   \`\`\`bash
   clarinet check
   \`\`\`

### Testing

Run the test suite:
\`\`\`bash
npm test
\`\`\`

## 📋 Contract Architecture

### Data Flow

1. **Trader Registration**: Traders register through the verification contract
2. **Verification**: Admin verifies traders and sets permissions
3. **Trading**: Verified traders create buy/sell orders
4. **Price Optimization**: System optimizes prices based on market conditions
5. **Risk Assessment**: Risk management validates all trades
6. **Settlement**: Successful trades are settled through the settlement contract

### Key Functions

#### Trader Verification
- \`register-trader\`: Register a new energy trader
- \`verify-trader\`: Verify and activate a trader
- \`suspend-trader\`: Suspend a trader's activities

#### Trading Coordination
- \`create-sell-order\`: Create a sell order for energy
- \`create-buy-order\`: Match with existing sell orders
- \`execute-trade\`: Execute matched trades

#### Price Optimization
- \`update-market-data\`: Update supply/demand data
- \`set-base-price\`: Set base energy price
- \`get-current-price\`: Get optimized current price

#### Settlement Management
- \`create-settlement\`: Create settlement for completed trade
- \`lock-escrow-funds\`: Lock funds in escrow
- \`process-settlement\`: Process and complete settlement

#### Risk Management
- \`set-trader-risk-profile\`: Set risk parameters for traders
- \`validate-trade-risk\`: Validate trade against risk limits
- \`update-market-risk-metrics\`: Update system risk metrics

## 🔧 Configuration

### Environment Variables

- \`STACKS_NETWORK\`: Network configuration (testnet/mainnet)
- \`CONTRACT_DEPLOYER\`: Deployer address
- \`BASE_ENERGY_PRICE\`: Initial base price for energy

### Risk Parameters

The platform includes configurable risk levels:
- **Low Risk**: 20% max exposure, 110% collateral ratio
- **Medium Risk**: 15% max exposure, 125% collateral ratio
- **High Risk**: 10% max exposure, 150% collateral ratio
- **Critical Risk**: 5% max exposure, 200% collateral ratio

## 📊 Usage Examples

### Register as a Trader

\`\`\`clarity
(contract-call? .trader-verification register-trader "LICENSE123" u1000)
\`\`\`

### Create a Sell Order

\`\`\`clarity
(contract-call? .trading-coordination create-sell-order u100 u50 u1000)
\`\`\`

### Check Current Price

\`\`\`clarity
(contract-call? .price-optimization get-current-price u1)
\`\`\`

## 🛡️ Security Features

- **Multi-level verification**: Traders must be verified before trading
- **Risk management**: Comprehensive risk assessment for all trades
- **Escrow system**: Secure fund management during settlements
- **Access controls**: Role-based permissions throughout the system
- **Audit trails**: Complete transaction history and logging

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For support and questions:
- Create an issue in the repository
- Contact the development team
- Check the documentation wiki

## 🔮 Roadmap

- [ ] Integration with external price feeds
- [ ] Advanced analytics dashboard
- [ ] Mobile application support
- [ ] Cross-chain compatibility
- [ ] AI-powered risk assessment
- [ ] Automated market making features

---

Built with ❤️ for the future of energy trading

