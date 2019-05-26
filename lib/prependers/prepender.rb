# frozen_string_literal: true

module Prependers
  class Prepender < Module
    attr_reader :namespace

    def initialize(namespace = nil)
      @namespace = namespace
    end

    def included(base)
      prepended_module_name = base.name.split('::')[0..-2].join('::')

      if namespace
        prepended_module_name = "#{prepended_module_name[(namespace.name.length + 2)..-1]}"
      end

      prepended_module = Object.const_get(prepended_module_name)
      prepended_module.prepend base
    end
  end
end