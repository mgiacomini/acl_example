defmodule AclExample.Crm.Translator do
  @type schema :: map

  @callback to_crm(schema) :: schema
  @callback from_crm(schema) :: schema
end
