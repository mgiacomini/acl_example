defmodule AclExample.CustomerManagement.Proposal do
  @behaviour AclExample.Crm.Translator

  alias AclExample.Crm.Lead

  defstruct [:id, :external_id]

  def to_crm(%Proposal{} = proposal) do
    # here need to know if we want to transform in lead or opportunity
    # and return an sboject

    %Lead{}
  end

  def from_crm(%Lead{} = lead) do
  end

  def from_crm(%Opportunity{} = opportunity) do
  end
end
