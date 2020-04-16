defmodule AclExample.Crm do
  alias AclExample.Crm.Lead

  alias AclExample.CustomerManagement

  ## Calls from salesforce

  def create_lead(%Lead{} = lead) do
    lead
    |> save()
    |> Proposal.from_crm()
    |> CustomerManagement.create_proposal_from_crm()

    {:ok, attrs}
  end

  def update_lead(lead, attrs) do
    {:ok, lead}
  end

  def find_lead_by_email(attrs) do
    {:ok, attrs}
  end

  def update_opportunity(opportunity, attrs) do
    {:ok, opportunity}
  end
end
