#ifndef MEDCOMPOSITEDATESETBASE_H
#define MEDCOMPOSITEDATESETBASE_H

#include <map>
#include <string>

#include <dtkCore/dtkAbstractData.h>
#include <dtkCore/dtkLog.h>

namespace MedInria {

    //  A base class for all composite data sets.

    class medCompositeDataSetsBase: public dtkAbstractData {
    public:

        virtual bool    registered()  const = 0;
        virtual QString description() const = 0;

        //  Verification that there is a handler for this specific type and version of the format.
        //  Returns a new instance of a reader/writer for that format.

        static medCompositeDataSetsBase* known(const std::string& type,const unsigned version) {
            for (Registery::const_iterator i=registery().begin();i!=registery().end();++i)
                if (type==i->first && i->second->has_version(version)) {
                    return i->second->clone(version);
            }

            return 0;
        }

        //  Check that the plugin can handle a given version ofthe file format.

        virtual bool has_version(const unsigned) const = 0;

        //  Create a new instance tuned for the revision version ofthe file format.

        virtual medCompositeDataSetsBase* clone(const unsigned version) const = 0;

        //  Read the description from an array.

        virtual void read_description(const QByteArray& buf) = 0;

        static QStringList initialize() {
            QStringList& ql = known_types();
            for (Registery::const_iterator i=registery().begin();i!=registery().end();++i) {
                const QString desc = i->second->description();
                if (!(i->second->registered()))
                    dtkWarning() << "Unable to register " << desc << " type";
                ql << desc;
            }
            qDebug() << ql;
            return ql;
        }

        static QStringList handled() { return known_types(); }

    protected:

        medCompositeDataSetsBase(const std::string& name,const medCompositeDataSetsBase* proto) {
            registery().insert(Registery::value_type(name,proto));
        }

    private:

        typedef std::map<std::string,const medCompositeDataSetsBase*> Registery;

        static Registery& registery() {
            static Registery reg;
            return reg;
        }

        static QStringList& known_types() {
            static QStringList types;
            return types;
        }
    };
}

#endif  //  ! MEDCOMPOSITEDATESETBASE_H
