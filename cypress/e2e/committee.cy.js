describe('Committee', () => {
  beforeEach(() => {
    cy.request('/cypress_rails_reset_state')
  })

  it('shows tickets', () => {
    cy.visit('/committees')
    cy.get('a').first().click()
    cy.get('li[id^="ticket-"]').should('have.length', 1)
    cy.get('a').click()
    cy.get('input[id="ticket_title"').type('New Ticket')
    cy.get('textarea[id="ticket_body"').type('Some more text...')
    cy.get('input[type="submit"]').click()
    cy.get('li[id^="ticket-"]').should('have.length', 2)
  })

  it('resets tickets between tests', () => {
    cy.visit('/committees')
    cy.get('a').first().click()
    cy.get('li[id^="ticket-"]').should('have.length', 1)
  })
})
