defmodule AclExample.Subscribers.ProposalCreatedSubscriber do
  alias AclExample.CustomerManagement.Proposal

  alias AclExample.Crm.Lead
  alias AclExample.Crm.Opportunity

  def process(message) do
    proposal = struct(Proposal, message.body)

    case Proposal.to_crm(proposal) do
      %Lead{} = lead -> Salesforce.create_lead(lead)
      %Opportunity{} = opportunity -> Salesforce.create_opportunity(opportunity)
    end
  end
end
