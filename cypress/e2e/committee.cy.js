describe('Committee', () => {
  beforeEach(() => {
    cy.request('/cypress_rails_reset_state')
  })

  it('shows tickets', () => {
    cy.visit('/committees')

    // Click on the first Committee. Its ID is unknown because of Fixtures 🤷‍♂️
    cy.get('a').first().click()

    // Click the New Ticket link
    cy.get('a').click()

    // Enter data in the Ticket form
    cy.get('input[id="ticket_title"').type('New ticket created by Cypress')
    cy.get('textarea[id="ticket_body"').type(
      'This ticket should be removed from the app between tests!',
    )
    cy.get('input[type="submit"]').click()

    cy.contains('New ticket created by Cypress')
    cy.contains('This ticket should be removed from the app between tests!')
  })

  it('resets tickets between tests', () => {
    cy.visit('/committees')

    // Click on the first Committee. Its ID is unknown because of Fixtures 🤷‍♂️
    cy.get('a').first().click()

    cy.get('li[id^="ticket-"]').should('have.length', 1)
  })
})
