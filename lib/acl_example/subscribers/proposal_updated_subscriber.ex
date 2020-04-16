defmodule AclExample.Subscribers.ProposalUpdatedSubscriber do
  alias AclExample.CustomerManagement.Proposal

  alias AclExample.Crm.Lead
  alias AclExample.Crm.Opportunity

  def process(message) do
    proposal = struct(Proposal, message.body)

    case Proposal.to_crm(proposal) do
      %Lead{} = lead -> Salesforce.update_lead(lead)
      %Opportunity{} = opportunity -> Salesforce.update_opportunity(opportunity)
    end
  end
end
