;; Trader Verification Contract
;; Validates and manages utility energy traders

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_TRADER_EXISTS (err u101))
(define-constant ERR_TRADER_NOT_FOUND (err u102))
(define-constant ERR_INVALID_STATUS (err u103))

;; Trader status constants
(define-constant STATUS_PENDING u0)
(define-constant STATUS_VERIFIED u1)
(define-constant STATUS_SUSPENDED u2)
(define-constant STATUS_REVOKED u3)

;; Data structures
(define-map traders
  { trader-id: principal }
  {
    status: uint,
    verification-date: uint,
    license-number: (string-ascii 50),
    energy-capacity: uint,
    reputation-score: uint
  }
)

(define-map trader-permissions
  { trader-id: principal }
  {
    can-buy: bool,
    can-sell: bool,
    max-trade-amount: uint
  }
)

(define-data-var total-traders uint u0)

;; Public functions
(define-public (register-trader (license-number (string-ascii 50)) (energy-capacity uint))
  (let ((trader-id tx-sender))
    (asserts! (is-none (map-get? traders { trader-id: trader-id })) ERR_TRADER_EXISTS)
    (map-set traders
      { trader-id: trader-id }
      {
        status: STATUS_PENDING,
        verification-date: block-height,
        license-number: license-number,
        energy-capacity: energy-capacity,
        reputation-score: u50
      }
    )
    (map-set trader-permissions
      { trader-id: trader-id }
      {
        can-buy: false,
        can-sell: false,
        max-trade-amount: u0
      }
    )
    (var-set total-traders (+ (var-get total-traders) u1))
    (ok trader-id)
  )
)

(define-public (verify-trader (trader-id principal) (max-trade-amount uint))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (asserts! (is-some (map-get? traders { trader-id: trader-id })) ERR_TRADER_NOT_FOUND)
    (map-set traders
      { trader-id: trader-id }
      (merge (unwrap-panic (map-get? traders { trader-id: trader-id }))
        { status: STATUS_VERIFIED }
      )
    )
    (map-set trader-permissions
      { trader-id: trader-id }
      {
        can-buy: true,
        can-sell: true,
        max-trade-amount: max-trade-amount
      }
    )
    (ok true)
  )
)

(define-public (suspend-trader (trader-id principal))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (asserts! (is-some (map-get? traders { trader-id: trader-id })) ERR_TRADER_NOT_FOUND)
    (map-set traders
      { trader-id: trader-id }
      (merge (unwrap-panic (map-get? traders { trader-id: trader-id }))
        { status: STATUS_SUSPENDED }
      )
    )
    (ok true)
  )
)

;; Read-only functions
(define-read-only (get-trader-info (trader-id principal))
  (map-get? traders { trader-id: trader-id })
)

(define-read-only (get-trader-permissions (trader-id principal))
  (map-get? trader-permissions { trader-id: trader-id })
)

(define-read-only (is-verified-trader (trader-id principal))
  (match (map-get? traders { trader-id: trader-id })
    trader-data (is-eq (get status trader-data) STATUS_VERIFIED)
    false
  )
)

(define-read-only (get-total-traders)
  (var-get total-traders)
)
