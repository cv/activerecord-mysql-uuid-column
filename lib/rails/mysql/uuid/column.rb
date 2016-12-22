require "rails/mysql/uuid/column/version"
require 'active_record'

module ActiveRecord
  module ConnectionAdapters
    module MySQL
      module ColumnMethods
        def uuid(*args, **options)
          # http://dba.stackexchange.com/questions/904/mysql-data-type-for-128-bit-integers
          # http://dev.mysql.com/doc/refman/5.7/en/binary-varbinary.html
          args.each { |name| column(name, :binary, options.merge(limit: 16)) }
        end
      end
    end
  end
end

module Rails
  module Mysql
    module Uuid
      module Column
        # Your code goes here...
      end
    end
  end
end
