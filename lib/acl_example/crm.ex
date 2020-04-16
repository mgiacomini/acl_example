defmodule AclExample.Crm do
  @moduledoc """
  This module will be consumed by a phoenix controller that receive calls from Salesforce.
  """

  alias AclExample.Crm.Lead
  alias AclExample.Crm.Opportunity

  alias AclExample.CustomerManagement.Proposal

  def create_lead(%{} = attrs) do
    struct!(Lead, attrs)
    |> Proposal.from_crm()
    |> publish_event(:proposal_created)
  end

  def update_lead(%Lead{} = lead, attrs) do
    struct!(lead, attrs)
    |> Proposal.from_crm()
    |> publish_event(:proposal_updated)
  end

  def create_opportunity(%{} = attrs) do
    struct!(Opportunity, attrs)
    |> Proposal.from_crm()
    |> publish_event(:proposal_updated)
  end

  def update_opportunity(%Opportunity{} = opportunity, attrs) do
    struct!(opportunity, attrs)
    |> Proposal.from_crm()
    |> publish_event(:proposal_updated)
  end

  defp publish_event(%Lead{} = lead, _event), do: {:ok, lead}
  defp publish_event(%Opportunity{} = opportunity, _event), do: {:ok, opportunity}
end
